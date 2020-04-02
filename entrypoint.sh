#!/bin/bash

USER_NAME=${USER_NAME:-build}
USER_GROUP=${USER_GROUP:-build}
USER_UID=${USER_UID:-1001}
USER_GID=${USER_GID:-1001}

# Delete the already existing user / group if existing

if id -u $USER_NAME > /dev/null 2>&1  ; then
    deluser $USER_NAME > /dev/null 2>&1
fi

if getent passwd $USER_UID > /dev/null 2>&1  ; then
    CLASH_USER="$(getent passwd $USER_UID | cut -d: -f1)"
    deluser $CLASH_USER > /dev/null 2>&1
fi

if getent group $USER_GID > /dev/null 2>&1  ; then
    CLASH_GROUP="$(getent group $USER_GID | cut -d: -f1)"
    # Try to delete the clashing group. If it has users we will just have to use that group (It's ok, the GID is what we wanted)
    if ! delgroup $CLASH_GROUP > /dev/null 2>&1  ; then
      USER_GROUP=$CLASH_GROUP
    else
      groupadd -g $USER_GID $USER_GROUP > /dev/null 2>&1
    fi
else
  groupadd -g $USER_GID $USER_GROUP > /dev/null 2>&1
fi

# Create our user & group with the specified details
mkdir -p /home/$USER_NAME
chown -R $USER_UID:$USER_GID /home/$USER_NAME
useradd -u $USER_UID -s /bin/bash -d /home/$USER_NAME -g $USER_GROUP $USER_NAME > /dev/null 2>&1

chown -R $USER_UID:$USER_GID /home/$USER_NAME
chmod -R ug+s /home/$USER_NAME
setfacl -R -d -m u:1000:rwx /home/$USER_NAME
setfacl -R -d -m u:1001:rwx /home/$USER_NAME

exec "$@"
