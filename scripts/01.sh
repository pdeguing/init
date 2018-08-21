printf "%-25s | %10s | %s\n" "LOGIN" "UID" "PATH";
cat /etc/passwd |awk -F ':' '{printf "%-25s | %10d | %s\n", $1, $3, $6}'
