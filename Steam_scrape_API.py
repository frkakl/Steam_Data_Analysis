# import libraries
import csv
import requests
import pandas as pd

# get the first page
response = requests.get("https://steamspy.com/api.php?request=all&page=0")
print(response.status_code)
json = response.json()
df = pd.DataFrame.from_dict(json, orient='index')

# get the rest of the pages
for i in range(1, 999999999):
    response = requests.get("https://steamspy.com/api.php?request=all&page={}".format(i))

    # check if the page is OK
    if response.status_code == 200:
        print("Page {} is OK".format(i))
        json = response.json()
        df1 = pd.DataFrame.from_dict(json, orient='index')
        frame = [df, df1]
        df =pd.concat(frame)

    # if the page is not OK, stop the loop
    else:
        print("Page {} is not OK".format(i))
        print("Scrape stopped at page {}".format(i-1))
        break

# export as csv
df.to_csv('app_list.csv', index=False)

#API_Source: https://steamspy.com/
