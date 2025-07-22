#!/bin/bash

echo "🎙️ Add New Podcast Info"

read -p "Podcast Name: " podcast_name
read -p "Website URL: " website_url
read -p "Category: " category
read -p "Contact Email: " email

echo "$podcast_name,$website_url,$category,$email" >> ../data/podcasts.csv

echo "✅ Saved Successfully!"
