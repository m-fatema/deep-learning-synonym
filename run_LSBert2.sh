export BERT_DIR=./
export Result_DIR=./outputDir


lex=lex.mturk.txt
nn=NNSeval.txt
ben=BenchLS.txt

python3 LSBert2.py \
  --do_eval \
  --do_lower_case \
  --num_selections 10 \
  --prob_mask 0.5 \
  --eval_dir $BERT_DIR/datasets/$lex \
  --bert_model bert-large-uncased-whole-word-masking \
  --max_seq_length 250 \
  --word_embeddings ./fastText-embeddings/crawl-300d-2M-subword.vec\
  --word_frequency $BERT_DIR/SUBTLEX_frequency.xlsx\
  --ppdb ./ppdb/ppdb-2.0-tldr\
  --output_SR_file $Result_DIR/run_LSBert2_py_features.txt ##> test_results.txt

