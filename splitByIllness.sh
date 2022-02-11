infile=$1
metric="Deaths"
for illness in "Ebola" "trematodiases" "Leprosy" "Zika"; do
  echo -n "Splitting out ${metric} data for ${illness}... "
  outfile=${illness}.csv
  # Extract header line
  head -n 1 ${infile} > ${outfile}
  # Extract lines for illness
  grep ${illness} ${infile} | grep ${metric} >> ${outfile}
  # Extract lines for illness
  lines=`wc -l ${outfile} | cut -d " " -f 1`
  echo "done, extracted ${lines} entries into ${outfile}."
done
