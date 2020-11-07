
while :
do
  git fetch
  git pull
  /c/Python27/python.exe PerfModel.py
  git add README.md
  git commit -m "auto commit"
  git push
	echo "Press [CTRL+C] to stop.."
	sleep 10
done
