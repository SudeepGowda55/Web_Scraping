#!/bin/bash

echo "Web Scraping Using BASH && Python3"

cat <<'EOF' > pyscripts.py 
#!/usr/bin/python3

import requests
from bs4 import BeautifulSoup

url = input("Please enter the URL of the website you want to scrape: ")

response = requests.get(url)

soup = BeautifulSoup(response.content, 'html.parser')

print("Web Application Content has been successfuly fetched")

findelement = input("Please enter the element, which you want to find: ")

tagdata = soup.find(str(findelement))
print(tagdata)

file = open("web.html", "w")

file.write(soup.prettify())

file.close()

EOF

chmod +x pyscripts.py

./pyscripts.py

read -p "Do you want to search any keyword in bs4 html tree? 'y or n' : " CHOICE 

if [[ $CHOICE = 'y' ]]; then
    read -p "Please Enter the Keyword you want to search: " KEYWORD
    OUTPUT=$( grep -n "$KEYWORD" web.html )
    echo " $OUTPUT "
    exit 0
else 
    exit 0
fi