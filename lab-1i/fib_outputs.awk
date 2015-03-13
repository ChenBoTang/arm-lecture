BEGIN {
         printf( "#gnuplot> plot \"iterative_fib_time\"\n" ) > "iterative_fib_time"
         printf( "#gnuplot> set style data linespoints\n" ) > "iterative_fib_time"
         printf( "#gnuplot> set ylabel \"time(sec)\"\n" ) > "iterative_fib_time"
         printf( "#gnuplot> set xlabel \"fibonacci index\"\n" ) > "iterative_fib_time"
         printf( "#gnuplot> set grid\n" ) > "iterative_fib_time"
         printf( "#gnuplot> replot\n" ) > "iterative_fib_time"
         printf( "#\n" ) > "iterative_fib_time"
         printf( "#idx\ttime(sec)\n" ) > "iterative_fib_time"
         printf( "#---\t----------\n" ) > "iterative_fib_time"
      }

      {
         printf( "%d\n", $7 ) > "output.txt"
         printf( "%d\t%5.6f\n", $5, $10 ) > "iterative_fib_time"
      }
