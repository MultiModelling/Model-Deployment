export $(grep -v '^#' .env | xargs)
cd $INFRA_PATH
for d in ./Model-*/ ; do (cd "$d" && docker-compose up --build --detach); done
for d in ./Database-*/ ; do (cd "$d" && docker-compose up --build --detach); done
for d in ./Adapter-*/ ; do (cd "$d" && docker-compose up --build --detach); done