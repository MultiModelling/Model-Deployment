# Reset Modules
export $(grep -v '^#' .env | xargs)
cd $INFRA_PATH
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} fetch origin \;
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} reset --hard origin/main \;