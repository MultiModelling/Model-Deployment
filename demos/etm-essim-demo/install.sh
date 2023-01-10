# Clone Modules
mkdir mmvib-infra
cd mmvib-infra

docker network create "mmvib-net"

git clone https://github.com/MultiModelling/Model-Orchestrator.git
git clone https://github.com/MultiModelling/Model-Registry.git

git clone https://github.com/MultiModelling/Database-MinIO.git

git clone https://github.com/MultiModelling/Adapter-ETM-Price-Profile.git
git clone https://github.com/MultiModelling/Adapter-ESDL-Add-Price-Profile.git
git clone https://github.com/MultiModelling/Adapter-ESSIM.git