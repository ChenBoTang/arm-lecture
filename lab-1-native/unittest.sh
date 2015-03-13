#!/bin/bash

INDEX=0

echo "###### fibonacci unit tests start ######"

# assign output file name
if [ -z $1 ]; then
	OUTPUT_FILE="output.txt"
else
	OUTPUT_FILE=$1
fi

# assign answer file name
if [ -z $2 ]; then
	ANSWER_FILE="fib.answer"
else
	ANSWER_FILE=$2
fi

# assign gnuplot file name
if [ -z $3 ]; then
	GNUPLOT_FILE="recursive_fib_time"
else
	GNUPLOT_FILE=$3
fi

# assign temp file name
if [ -z $4 ]; then
	TEMP_FILE="temp.txt"
else
	TEMP_FILE=$4
fi

#clear temp file
rm -rf ${OUTPUT_FILE} ${GNUPLOT_FILE} ${TEMP_FILE}

# detect if the executable file exists
if [ -e fibseq ]; then
	echo "fibseq exists!"
else
	echo "fibseq doesn't exit!"
	exit -1
fi

# detect if the answer file exists
if [ -e fib.answer ]; then
	echo "The answer file exists!"
else
	echo "The answer file doesn't exist!"
	exit -2
fi

# read correct answers from the answer file
# and store them in a array
while read line; do
	ANSWER[$INDEX]="$line"
	INDEX=`expr $INDEX + 1`
done < ${ANSWER_FILE}

for (( INPUT=0; INPUT<${#ANSWER[@]}; INPUT++ )); do
	# print message
	echo "calculating fibonacci["${INPUT}"]..."

	# calculate fibonacci sequence
	echo ${INPUT} | ./fibseq >> ${TEMP_FILE}
done

# generate output files for verification and gnuplot
awk -f fib_outputs.awk ${TEMP_FILE}

INDEX=0
while read line; do
	OUTPUT[$INDEX]="$line"

# > debug messages
#	echo "OUTPUT[$INDEX]=>"${OUTPUT[$INDEX]}"<="
#	echo "ANSWER[$INDEX]=>"${ANSWER[$INDEX]}"<="
#	echo ""
# < debug messages

	if [ "${OUTPUT[$INDEX]}" = "${ANSWER[$INDEX]}" ]; then
		echo "fibonacci["${INDEX}"]="${OUTPUT[$INDEX]}", correct!"
	else
		echo "fibonacci["${INDEX}"]="${OUTPUT[$INDEX]}", incorrect!"
	fi

	INDEX=`expr $INDEX + 1`
done < ${OUTPUT_FILE}

#clear temp file
rm -rf ${OUTPUT_FILE} ${TEMP_FILE}

echo "###### fibonacci unit tests finish ######"

exit 0
