#get '/' do
 #   File.read(File.join('app/views', 'index.html'))
#end
get '/' do
username = "sharky_j"
avater_url = "http://naserca.com/images/sharky_j.jpg"
photo_url = "http://naserca.com/images/shark.jpg"
time_ago_in_minutes = 156
like_count = 0
comment_count = 1
comments = ["sharky_j: Out for the long weekend... too embarrassed to show y'all the beach bod!"]
#if the time_ago_in_minutes is greater than 60
if time_ago_in_minutes > 60
    #return this string
    "more than an hour ago"
    #if it's equal to 60
elsif time_ago_in_minutes == 60
"an hour"
    #if it's less than 60
    elsif time_ago_in_minutes <= 1
        "Just a moment ago"
else
    #return this instead
    "less than an hour"
end

def humanized_time_ago(minute_num)
    if minute_num >= 60
        "#{minute_num /60} hours ago"
    else
        "#{minute_num} minutes ago"
    end
end