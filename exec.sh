
PWD=$(printf '%q\n' "${PWD##*/}")
PWD=${PWD//[^a-zA-Z\d\-\_:]/}
USER=build
COMMAND=bash
WORKDIR=/home/build

if [ $1 ] ; then
    COMMAND=$1
fi

if [ $2 ] ; then
    USER=$2
    WORKDIR="/home/$2"
fi

if [ "$2" == "root" ] ; then
    WORKDIR="/root"
fi


CONTAINERS=($(docker ps | awk '{print $NF}' | grep $PWD))

if [ ! ${CONTAINERS[@]} ] ; then
  echo "No running containers for $PWD"
  exit 1
fi



if [ ${CONTAINERS[1]} ] ; then
	
echo ""
echo "Select the container to access..."
echo ""

select CONTAINER in "${CONTAINERS[@]}"
do
    break
done
else
  CONTAINER=${CONTAINERS[0]}
fi

if [ ! $CONTAINER ] ; then
 echo "No container selected"
 exit 1
fi

docker exec -u $USER -w $WORKDIR -ti $CONTAINER $COMMAND
