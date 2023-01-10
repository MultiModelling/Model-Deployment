# Update Modules
export $(grep -v '^#' .env | xargs)
cd $INFRA_PATH
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin main \;