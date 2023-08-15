#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_32.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_27.txt
 https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Formats/GoodbyeAds-AdBlock-Filter.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_16.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_23.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_29.txt
 https://adguardteam.github.io/HostlistsRegistry/assets/filter_21.txt
 https://raw.githubusercontent.com/badmojr/1Hosts/master/Pro/adblock.txt
 
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
