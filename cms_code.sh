if [ ! -d CMS ]
then
	mkdir CMS
fi

#if [ ! -d CMS/Share ]
#then
#	mkdir CMS/Share
#fi

if [ ! -f CMS/login.txt ]
then
	echo "" > CMS/login.txt
fi

while [ 1 ]
do
	echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
	echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\t\033[31m1.Admin\t\t\033[0m\033[44m**\033[0m"
	echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\t\033[31m2.Singup\t\033[0m\033[44m**\033[0m"
	echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\t\033[31m3.Login\t\t\033[0m\033[44m**\033[0m"
	echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\t\033[31m4.Exit\t\t\033[0m\033[44m**\033[0m"
	echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
	echo -n -e "\t\t\t\t\t\t\t\033[31mEnter your choice : \033[0m" 
	read ch1
	echo

	if [ $ch1 -eq 1 ]
	then
		while [ 1 ]
		do			
			echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
			echo -e "\t\t\t\t\t\t\t\033[0m\033[44m**\033[0m\033[31m 1.Create New User.\033[0m\t\033[44m**\033[0m"
			echo -e "\t\t\t\t\t\t\t\033[0m\033[44m**\033[0m\033[31m 2.Delete A User.\033[0m\t\033[44m**\033[0m"
			echo -e "\t\t\t\t\t\t\t\033[0m\033[44m**\033[0m\033[31m 3.Back to main menu.\033[0m\t\033[44m**\033[0m"
			echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
			echo -n -e "\t\t\t\t\t\t\t\033[31mEnter your choice : \033[0m" 
			read ch2
			echo
		
			if [ $ch2 -eq 2 ]
			then
				echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"	
				echo -n -e "\t\t\t\t\t\t\t\033[0m   \033[31mUsername :\033[0m"
				read a
				echo -n -e "\t\t\t\t\t\t\t\033[0m   \033[31mPassword :\033[0m" 
				read b
	
				array=( `cat  CMS/login.txt` )		
				l1=${#array[*]}	
				k=0
		
				for ((i=0;i<$l1;i++))
				do	
					j=`expr $i + 1`			
					if [ ${array[$i]} == $a ] && [ ${array[$j]} == $b ]
					then			 
						d=1
						break
					fi
				done
		
				> CMS/login.txt
		
				if [ $d -eq 1 ]	
				then
						i=0
					j=1	
					while [ $i -lt $l1 ]
					do			
						if [ ${array[$i]} != $a ] && [ ${array[$j]} != $b ]
							then			 
							echo  ${array[$i]} >> CMS/login.txt ${array[$j]} >> CMS/login.txt
						fi
						i=`expr $i + 2`
						j=`expr $j + 2` 
						done
					
					rm -r CMS/$a
					echo -e "\t\t\t\t\t\t      \033[42mUser account has been deleted.\033[0m"
	
				else
					echo -e "\t\t\t\t\t\t\t  \033[42mCheck Username & Password.\033[0m"
					
				fi
				echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
				echo		
				fi

			if [ $ch2 -eq 1 ]
			then
				echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
				echo -n -e "\t\t\t\t\t\t\t\033[0m \033[31mUsername :\033[0m"
				read a
				echo -n -e "\t\t\t\t\t\t\t\033[0m \033[31mPassword :\033[0m" 
				read b
				
				array=( `cat  CMS/login.txt` )		
				l1=${#array[*]}	
				d=0
			
				for ((i=0;i<$l1;i++))
				do	
					j=`expr $i + 1`			
					if [ ${array[$i]} == $a ]
					then			 
						d=1
						break
					fi
				done
				
				if [ $d -eq 0 ]
				then
					echo $a >> CMS/login.txt $b >> CMS/login.txt
					echo
					
					if [ ! -d CMS/$a ]
					then					
						mkdir CMS/$a
						mkdir CMS/$a/MSG
						mkdir CMS/$a/APP
						mkdir CMS/$a/Downloads
						echo "" > CMS/$a/MSG/msg.txt
						echo "" > CMS/$a/APP/app.txt
						echo -e "\t\t\t\t\t\t      \033[42mUser account has been created.\033[0m"
					fi 
				else	
					echo -e "\t\t\t\t\t\t\t  \033[42mUsername already exist.\033[0m"	
				fi
				echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
				echo
			fi

			if [ $ch2 -eq 3 ]
			then
				break
			fi
		done
	fi
	
	
	if [ $ch1 -eq 2 ]
	then
		echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
		echo -n -e "\t\t\t\t\t\t\t\033[0m \033[31mUsername :\033[0m"
		read a
		echo -n -e "\t\t\t\t\t\t\t\033[0m \033[31mPassword :\033[0m" 
		read b
		
		array=( `cat  CMS/login.txt` )		
		l1=${#array[*]}	
		d=0
		
		for ((i=0;i<$l1;i++))
		do	
			j=`expr $i + 1`			
			if [ ${array[$i]} == $a ] && [ ${array[$j]} == $b ]
			then			 
				d=1
				break
			fi
		done
		
		if [ $d -eq 0 ]
		then
			echo $a >> CMS/login.txt $b >> CMS/login.txt
			echo -e "\t\t\t\t\t\t      \033[42mUser account has been created.\033[0m"
			echo
		else	
			echo -e "\t\t\t\t\t\t\t  \033[42mUsername already exist.\033[0m"	
		fi
		echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
		echo
 
		if [ ! -d CMS/$a ]
		then
			mkdir CMS/$a
			mkdir CMS/$a/MSG
			mkdir CMS/$a/APP
			mkdir CMS/$a/Downloads
			echo "" > CMS/$a/MSG/msg.txt
			echo "" > CMS/$a/APP/app.txt
		fi 
			
	fi	

	if [ $ch1 -eq 3 ] 
	then
		echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"	
		array=( `cat  CMS/login.txt` )
		echo -n -e "\t\t\t\t\t\t\t\033[0m   \033[31mUsername :\033[0m"
		read a
		echo -n -e "\t\t\t\t\t\t\t\033[0m   \033[31mPassword :\033[0m" 
		read b
		l1=${#array[*]}	
		k=0
		for ((i=0;i<$l1;i++))
		do	
			j=`expr $i + 1`			
			if [ ${array[$i]} == $a ] && [ ${array[$j]} == $b ]
			then			 
				k=1
				break
			fi
		done

		if [ $k -eq 1 ]
		then
			echo -e "\t\t\t\t\t\t\t   \033[42m Welcome to linux.\033[0m"
			echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"	
			echo	
			
			msg=(`cat CMS/$a/MSG/msg.txt`)
			ll=${#msg[*]}
			if [ $ll -ne 0 ]
			then
				echo -e "\t\t\t\t\t\t\t\033[46m${msg[*]}\033[0m" 
				> CMS/$a/MSG/msg.txt
			fi

			s1=( `awk '{print $1}' CMS/$a/APP/app.txt` )
			s2=( `awk '{print $2}' CMS/$a/APP/app.txt` )
			l4=${#s2[*]}

			if [ $l4 -ne 0 ]
			then			
				for((i=0;i<$l4;i++))
				do
					for((j=0;j<=$i;j++))
					do
						x=`expr $j + 1`	
						p=${s2[$j]}
						q=${s2[$x]}			
					
						if [ "$q" \< "$p" ]
						then
							temp=${s2[$j]}
							s2[$j]=${s2[$x]}
							s2[$x]=$temp
							temp=${s1[$j]}	
							s1[$j]=${s1[$x]}
							s1[$x]=$temp
						fi
					done
				done
					
				if [ ${s1[$l4]} == c ] || [ ${s1[$l4]} == sh ] || [ ${s1[$l4]} == java ] || [ ${s1[$l4]} == txt ]
				then
							
					if [ ! -d CMS/$a/${s1[$l4]} ]
					then
						mkdir CMS/$a/${s1[$l4]}
					fi
					gedit CMS/$a/${s1[$l4]}/New.${s1[$l4]} &
				fi				
				if [ ${s1[$l4]} == firefox ]
				then
					gnome-www-browser 
				fi
				
				if [ ${s1[$l4]} == terminal ] || [ ${s1[$l4]} == screenshot ] || [ ${s1[$l4]} == calculator ]
				then
					gnome-${s1[$l4]} 
				fi
			fi
	
			while [ 1 ]
			do
				echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
				echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\033[31m1.Manage the Content.\t\033[0m\033[44m**\033[0m"
				echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\033[31m2.Set a Message.\t\033[0m\033[44m**\033[0m"
				echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\033[31m3.Search by Month\t\033[0m\033[44m**\033[0m"
				#echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\033[31m4.Sharing Center.\t\033[0m\033[44m**\033[0m"
				echo -e "\t\t\t\t\t\t\t\033[44m**\033[0m\033[31m4.Logout\t\t\033[0m\033[44m**\033[0m"
				echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
				echo -n -e "\t\t\t\t\t\t\t\033[31mEnter your choice : \033[0m" 
				read ch3
				echo
	
				if [ $ch3 -eq 1 ]
				then		
						
					echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"					
					while [ 1 ]
					do				
						echo -n -e "\t\t\t\t\t\t\t\033[31m Source_Path :\033[0m"
						read p 
						echo -e "\033[0m"
					
						if  [ ! -d ~/$p ]
						then 				
							echo -e "\t\t\t\t\t\t\t\033[42mSource_path doesn't exist.\033[0m"
							echo -e "\a"
						else
							break
						fi
					done
					
					while [ 1 ]
					do
						echo -n -e "\t\t\t\t\t\t\t\033[31m Filename :\033[0m"
						read fn
						echo -e "\033[0m"
						
						if [ ! -f $p/$fn ]
						then
							echo -e "\t\t\t\t\t\t\t\033[42mFile_Name doesn't exist.\033[0m"
							echo -e "\a"
						else					
							break
						fi
					done
					echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"	                					
					l=`expr index "$fn" .`
					d=${fn:$l}
							
					if [ ! -d CMS/$a/$d ]
					then
						mkdir CMS/$a/$d
					fi
				
					cp ~/$p/$fn ~/CMS/$a/$d/$fn
				
					gedit CMS/$a/$d/$fn &
					
					echo -n -e "\t\t\t\t\t\t\t\033[0mReplace with original file--\033[31m'Y' or 'N'?\033[0m "
					read choice
				
					if [ $choice = "Y" ]
					then  	
					cp ~/CMS/$a/$d/$fn ~/$p/
					fi		
				fi
					
				if [ $ch3 -eq 2 ]
				then
					echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"					
					echo -n -e "\t\t\t\t\t\t\t\033[31mReceiver's the username : \033[0m"
					read m
					if [ ! -d CMS/$m ]
					then
						echo -e "\t\t\t\t\t\t\t\033[42mUser_Name doesn't exist.\033[0m"
						echo -e "\a"
					else
						echo -n -e "\t\t\t\t\t\t\t\033[31mEnter the msg : \033[0m"
						read msg1
						echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
						echo
						> CMS/$m/MSG/msg.txt	
						echo $a >> CMS/$m/MSG/msg.txt "says :" >> CMS/$m/MSG/msg.txt $msg1 >> CMS/$m/MSG/msg.txt
					fi  						
				fi
				
				if [ $ch3 -eq 3 ]
				then
					if [ ! -f CMS/direc.txt ]
					then
						echo "" > CMS/direc.txt
					fi

					if [ ! -f CMS/direc1.txt ]
					then
						echo "" > CMS/direc1.txt
					fi  
					echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
					echo -n -e "\t\t\t\t\t\t\t\033[31mEnter the month(e.g.January=Jan) : \033[0m"
					read m

					`ls -l CMS/$a > CMS/direc.txt`

					direc=( `awk '{print $9}' CMS/direc.txt` )
					l=${#direc[*]}

					f=0				
					for ((i=0;i<$l;i++))
					do
						if [ ${direc[$i]} != "MSG" ]
						then
							if [ ${direc[$i]} != "APP" ]
							then
												
								`ls -l CMS/$a/${direc[$i]} > CMS/direc1.txt`
								direc1=( `awk '{print $9}' CMS/direc1.txt` )
								mon=( `awk '{print $6}' CMS/direc1.txt` )
								l1=${#direc1[*]}
								for((j=0;j<$l1;j++))
								do
									if [ "$m" = "${mon[$j]}" ]
									then
										f=1
										if [ $f -eq 1 ]
										then
											echo -e "\t\t\t\t\t\t\t\t\033[42m${direc1[$j]}\033[0m"
										fi
									fi
								done
							fi
						fi
					done
					if [ $f -eq 0 ]
					then
						echo -e "\t\t\t\t\t\t\t \033[42mNo file modified on $m.\033[0m"
					fi
					echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
					echo
				fi

				#if [ $ch3 -eq 4 ]
				#then
				#	`ls -l CMS/Share/ > CMS/direc.txt`
				#	direc=( `awk '{print $9}' CMS/direc.txt` )
				#	l=${#direc[*]}
				#	echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"  					
				#	for((i=0;i<$l;i++))
				#	do
    				#		echo -e "\t\t\t\t\t\t\t${direc[$i]}"
				#	done
				#	echo -n -e "\t\t\t\t\t\t\t\033[31mDownload to user's directory-- Y or N ?\033[0m"
				#	read o
				#	if [ "$o" = "Y" ]
				#	then
				#		echo -n -e "\t\t\t\t\t\t\t\033[31mEnter the Application_Name : \033[0m"
				#		read p
				#		cp ~/CMS/Share/$p CMS/$a/Downloads
				#		echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
				#		echo
				#	fi
				#fi

				if [ $ch3 -eq 4 ]
				then
					break
				fi
			done
		
		else
			echo -e "\t\t\t\t\t\t\t\033[42mCheck username & password.\033[0m"
			echo -e "\a"
			echo -e "\t\t\t\t\t\t\t\033[44m**************************\033[0m"
			echo
		fi
		
	fi	
	
	if [ $ch1 -eq 4 ]
	then
		exit
	fi
done		
