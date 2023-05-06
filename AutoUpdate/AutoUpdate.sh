#!/bin/bash

mode="1"
path=/home/sam170703dev/Documentos/Servicios/AutoUpdate

function actualizar() {
    
    sleep 60
    cd $logspath
    if [ $mode = "1" ];then

        apt-get update &> update.log
        apt-get upgrade -y &> upgrade.log

    fi

    if [ $mode = "2" ];then

        apt-get update &> update.log
        echo "null" > upgrade.log

    fi

    if [ $mode = "3" ];then

        echo "null" > update.log
        apt-get upgrade -y &> upgrade.log

    fi

    if [ $mode = "4" ];then

        echo "null" > update.log
        echo "null" > upgrade.log

    fi

}

function mantener-servicio-activo() {

    cd $path

    while [ 1 ];do 

        echo "Status: OK" > status.log
        sleep 600

    done

}

if [ -d $path ];then

    logspath=$path/logs

    if [ -d $logspath ];then

        actualizar
        mantener-servicio-activo

        else

            cd $path
            mkdir logs
            chmod 755 logs
            actualizar
            mantener-servicio-activo

    fi

    else

        cd /home/sam170703dev/Escritorio
        touch ERROR_AUTOUPDATE_SERVICE.log
        chmod 777 ERROR_AUTOUPDATE_SERVICE.log
        echo "ERROR: Path: /home/sam170703dev/Documentos/Servicios/AutoUpdate ; Path not found!" > ERROR_AUTOUPDATE_SERVICE.log

        exit 0

fi
