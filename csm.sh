echo "Chayote Script Manager"

if [ "$1" = "--help" ]; then
  echo "csm setup-aws-cdk"
fi
(
  curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/$1.sh" -o /tmp/$1.sh
  bash /tmp/$1.sh ${@:2} 
)
rm -f /tmp/$1.sh
