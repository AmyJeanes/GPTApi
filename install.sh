set -e

python3.13 -m pip install --no-cache-dir -r requirements.txt
python3.13 -m pip install torch==2.6.0+cpu --index-url https://download.pytorch.org/whl/cpu
