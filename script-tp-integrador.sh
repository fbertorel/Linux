#!/bin/bash
#TP Integrador - Script Shell
#Franco Bertorello
#Legajo: 0104560

while :
do
	read -p "Opciones:
	1- Fibonacci
	2- Mostrar numero de forma invertida
	3- Verificar si la cadena es palidromo
	4- Cantidad de lineas de archivo
	5- Mostrar 5 numeros ingresados de forma ordenada
	6- Mostrar cuantos archivos de cada tipo tiene un directorio
	7- Salir " opcion
	case $opcion in
		1)	clear
			echo "Fibonacci"
			#primer nro de fibonacci
			a=0
			#segundo nro de fibonacci
			b=1
			read -p "Ingrese un numero: " num
			for (( i=0; i<num; i++ ))
			do
				echo -n "$a "
				fn=$((a + b))
				a=$b
				b=$fn
			done
			;;
		2) 	clear
			echo "Invertir numero"
			read -p "Ingrese numero entero: " nroEntero
			echo $nroEntero | rev
			;;
		3)	 clear
			echo -e "Verificar si la cadena es palindromo\n"
			read -p "Ingrese texto: " cad
			revcad=""
			for i in $(seq 0 ${#cad}); do
				revcad=${cad:$i:1}$revcad
			done
			echo -e "\nString original: " $cad
			echo -e "\nString inverso: " $revcad
			if [ "$cad" = "$revcad" ]; then
				echo -e "\nEs palindromo"
			else
				echo -e "\nNo es palindromo"
			fi
			;;
		4) 	clear
			echo "Cantidad de lineas de un archivo de texto"
			read -p "Ingrese el path de un archivo de texto: " path
			echo $( wc -l $path )
			;;
		5)	clear
			echo "Ingrese 5 numeros enteros: "
			vector=()
			read -p "1) " n1
			read -p "2) " n2
			read -p "3) " n3
			read -p "4) " n4
			read -p "5) " n5
			echo  "$n1,$n2,$n3,$n4,$n5" | tr "," "\n" | sort -n
			;;
		6)	clear
			echo -e "\nCantidad de archivos en un directorio"
			read -p "\nIngrese path de directorio: " dir
			echo "Cantidad de directorios: "
			find $dir -type d | wc -l
			echo "Cantidad de block: "
			find $dir -type b | wc -l
			echo "Cantidad de links: "
			find $dir -type l | wc -l
			echo "Cantidad de pipes: "
			find $dir -type p | wc -l
			echo "Cantidad de archivos: "
			find $dir -type f | wc -l
			echo "Cantidad de caracther: "
			find $dir -type c | wc -l
			;;
		7)	clear
			echo "Adios "$USER" "
			exit 1
			;;
		*)	echo "Opcion invalida"
			exit 1
esac
done

