echo "Chayote Script Manager"

if [ "$1" = "--help" ]; then
  echo "csm setup-aws-cdk"
fi
(
  code=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/steve-fforde/scripts/main/$1.sh")
  echo "~~~ $code ~~~"
  curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/$1.sh" -o /tmp/$1.sh
  bash /tmp/$1.sh ${@:2} 
)
rm -f /tmp/$1.sh
