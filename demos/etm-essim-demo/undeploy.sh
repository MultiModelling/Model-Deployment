export $(grep -v '^#' .env | xargs)
cd $INFRA_PATH
for d in ./*/ ; do (cd "$d" && docker-compose stop); done

