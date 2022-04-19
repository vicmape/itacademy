('calle 1', 1, 1, 1, 'Barcelona', 08030, 'ESP'),



for ((i=1;i<=30;i++)); 
do 
   # your-unix-command-here
   echo "('calle $i', $i, $i, $i, 'Barcelona', 080$i, 'ESP'),"
done

for ((i=1;i<=10;i++)); 
do 
   # your-unix-command-here
   echo "('Provider $i', 00000$i, 11111$i, 22222$i, $i),"
done

for ((i=1;i<=20;i++)); 
do 
   # your-unix-command-here
   echo "('Brand $i', $i),"
done

for ((i=1;i<=20;i++)); 
do 
   # your-unix-command-here
   echo "('Brand $i', $i),"
done

for ((i=1;i<=10;i++)); 
do 
   # your-unix-command-here
   echo "($(( ( RANDOM % 5 )  + 1 )), $(( ( RANDOM % 5 )  + 1 )), 'blue', 'blue', $i.99, $(( ( RANDOM % 3 )  + 1 )),  $(( ( RANDOM % 20 )  + 1 )) ),"
done



client

for ((i=1;i<=20;i++)); 
do 
   # your-unix-command-here
   echo "(00000$i, '$i@gmail.com', $(( ( RANDOM % i )  + 1 )), $(( i + 9 ))),"
done

sales

for ((i=1;i<=20;i++)); 
do 
   # your-unix-command-here
   echo "('202$(( ( RANDOM % 2 )  + 1 ))-$(( ( RANDOM % 12 )  + 1 ))-$(( ( RANDOM % 28 )  + 1 ))', $(( ( RANDOM % 10 )  + 1 )).99, $(( ( RANDOM % 20 )  + 1 )), $(( ( RANDOM % 10 )  + 1 )), $(( ( RANDOM % 10 )  + 1 ))), "
done

$(( ( RANDOM % i )  + 1 ))

for ((i=1;i<=40;i++)); 
do 
   # your-unix-command-here
   echo "('L$i', $(( ( RANDOM % 20 )  + 1 ))),"
done

// botiga
for ((i=1;i<=20;i++)); 
do 
   # your-unix-command-here
   echo "('A$i', 000$i,  $(( ( RANDOM % 40 )  + 1 ))),"
done

for ((i=1;i<=100;i++)); 
do 
   # your-unix-command-here
   echo "('N$i','C$i','NIF$i', 0000$i, $(( ( RANDOM % 2 )  + 1 )), $(( ( RANDOM % 20 )  + 1 )), $(( ( RANDOM % 40 )  + 1 ))),"
done


seq -f "('P%g')," 20

for ((i=1;i<=100;i++)); 
do 
   # your-unix-command-here
   echo "('N$i','C$i','A$i', 0000$i, 0000$i, $(( ( RANDOM % 20 )  + 1 ))),"
done



for ((i=1;i<=100;i++)); 
do 
   echo "('2022-01-01', '00:00:00','2022-01-01', '00:00:00', $(( ( RANDOM % 5 )  + 1 )), 2, $(( ( RANDOM % 20 )  + 1 )), $(( ( RANDOM % 20 )  + 1 ))),"
done