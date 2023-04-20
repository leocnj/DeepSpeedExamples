
export http_proxy=http://pkg.proxy.prod.jp.local:10080
export https_proxy=http://pkg.proxy.prod.jp.local:10080
export HTTP_PROXY=http://pkg.proxy.prod.jp.local:10080
export HTTPS_PROXY=http://pkg.proxy.prod.jp.local:10080

cd /workdir/DeepSpeedExamples/applications/DeepSpeed-Chat/
pip install deepspeed>0.9.0
pip install -r requirements.txt

# Move into the first step of the pipeline
cd training/step1_supervised_finetuning/

# Run the training script
ulimit -n 99999 && bash training_scripts/single_node/run_1.3b_single.sh

# Evaluate the model
ulimit -n 99999 && bash evaluation_scripts/run_prompt.sh facebook/opt-1.3b output