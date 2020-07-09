echo "--------- build start ---------" 
cd ..
mvn clean package -Dmaven.test.skip=true 
cp  plink-dist/target/*.tar.gz plink-docker
cp  plink-web/src/main/resources/META-INF/sql/mysql/plink_init.sql plink-docker
docker build -t hairless/plink:master plink-docker
cd plink-docker &
echo "--------- build success ---------"
