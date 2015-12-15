# I was unhappy with curl not providing tcp connection details, redirect details, and DNS lookup details that all
# contribute to a slow HTTP call. So I wrote a script that made all the diagnostics from CURL in the ouput. 
# Input is just a valid URL. Output is all of the information about that HTTP transaction. 
curl -L -w '
url_effective:%{url_effective}
http_code:%{http_code}
time_total(s):%{time_total}
content_type:%{content_type} 
http_connect:%{http_connect}
num_connects:%{num_connects}
num_redirects:%{num_redirects}
size_download:%{size_download}
size_header:%{size_header}
size_request:%{size_request}
size_upload:%{size_upload}
speed_download:%{speed_download}
speed_upload:%{speed_upload}
time_connect:%{time_connect}
time_namelookup:%{time_namelookup}
time_pretransfer:%{time_pretransfer}
time_redirect:%{time_redirect}
time_starttransfer:%{time_starttransfer}
' \
-o /dev/null \
-s $1
