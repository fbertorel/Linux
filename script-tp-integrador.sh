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
			for ((i=0; i<=4; i++)) do
				read  num[i]
			done
			for (( i=0; i<=4;i++)) do
				for (( j=$i; j<=4; j++)) do
					if [ ${num[$i]} -gt ${num[$j]} ]; then
						aux=${num[$i]}
						num[$i]=${num[$j]}
						num[$j]=$aux
					fi
				done
			done
			echo "\n El numero ordenado es: " 
				for ((i=0; i<=4; i++)) do
					echo ${num[$i]}
				done
			;;
		6)	clear
			echo -e "\nCantidad de archivos en un directorio"
			read -p "\nIngrese path de directorio: " dir
			ls "$dir" | wc -l
			;;
		7)	clear
			echo "Adios "$USER" "
			exit 1
			;;
esac
done

