BEGIN {
         printf( "#gnuplot> plot \"recursive_fib_time\"\n" ) > "recursive_fib_time"
         printf( "#gnuplot> set style data linespoints\n" ) > "recursive_fib_time"
         printf( "#gnuplot> set ylabel \"time(sec)\"\n" ) > "recursive_fib_time"
         printf( "#gnuplot> set xlabel \"fibonacci index\"\n" ) > "recursive_fib_time"
         printf( "#gnuplot> set grid\n" ) > "recursive_fib_time"
         printf( "#gnuplot> replot\n" ) > "recursive_fib_time"
         printf( "#\n" ) > "recursive_fib_time"
         printf( "#idx\ttime(sec)\n" ) > "recursive_fib_time"
         printf( "#---\t----------\n" ) > "recursive_fib_time"
      }

      {
         printf( "%d\n", $7 ) > "output.txt"
         printf( "%d\t%5.6f\n", $5, $10 ) > "recursive_fib_time"
      }
