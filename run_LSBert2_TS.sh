export BERT_DIR=./
export Result_DIR=./outputDir


python3 recursive_LSBert2.py \
  --do_eval \
  --do_lower_case \
  --num_selections 10 \
  --prob_mask 0.5 \
  --eval_dir recursive_simplification.txt \
  --bert_model bert-large-uncased-whole-word-masking \
  --max_seq_length 250 \
  --word_embeddings ./fastText-embeddings/crawl-300d-2M-subword.vec\
  --word_frequency $BERT_DIR/SUBTLEX_frequency.xlsx\
  --ppdb ./ppdb/ppdb-2.0-tldr\
  --output_SR_file $Result_DIR/run_LSBERT2_TS_sh.txt ##> test_results.txts




   ##lex.mturk.txt \
