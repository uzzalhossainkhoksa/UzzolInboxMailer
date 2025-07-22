#!/bin/bash

csv_file="../data/podcasts.csv"
template_file="../templates/email_template.txt"
log_file="../logs/send_log.txt"

while IFS=',' read -r podcast_name website_url category email
do
    name=$(echo "$email" | cut -d'@' -f1)

    message=$(sed "s/{{name}}/$name/g; s/{{podcast_name}}/$podcast_name/g; s/{{website_url}}/$website_url/g" "$template_file")

    echo "Sending email to $email..."

    # SMTP sending command (যেমন termux-smtp অথবা msmtp) বসাতে হবে এখানে
    # নিচের অংশ আপনার SMTP server, sender email ও password দিয়ে কাস্টমাইজ করুন

    # echo "$message" | termux-smtp -s "We Found Your Podcast!" -t "$email" -f "uzzolhassan38@gmail.com" -u "uzzolhassan38@gmail.com" -p "YOUR_APP_PASSWORD" -h "smtp.gmail.com" -P 587

    echo "[$(date)] Email sent to $email" >> "$log_file"

    sleep 10
done < "$csv_file"

