# #New training for a scene
# torchrun train.py \
#         --nproc_per_node=1 \
#         --show_pbar \
#         --wandb --wandb_name ev_project \
#         --config=projects/neuralangelo/configs/ev.yaml \
#         --logdir=logs/ev_data/CTTBLO004_MA_house_1_DS1_n

# #Continue training from existing scene
# torchrun --nproc_per_node=1 \
#         train.py \
#         --show_pbar \
#         --wandb --wandb_name ev_project \
#         --config=projects/neuralangelo/configs/ev.yaml \
#         --data.root=datasets/ev/CALOSA120_ROI_1_DS8 \
#         --data.num_images=188 \
#         --data.train.image_size=[540,1024] \
#         --logdir=logs/ev_data/CALOSA120_ROI_1_DS8 \
#         --checkpoint=logs/ev_data/CALOSA120_ROI_1_DS8/epoch_01382_iteration_000260000_checkpoint.pt \
#         --resume

#Extract colored mesh
torchrun --nproc_per_node=1 \
        projects/neuralangelo/scripts/extract_mesh.py \
        --resolution=512 \
        --block_res=128 \
        --config=projects/neuralangelo/configs/ev.yaml \
        --data.root=datasets/ev/CALOSA120_ROI_1_DS8 \
        --data.num_images=188 \
        --data.train.image_size=[540,1024] \
        --checkpoint=logs/ev_data/CALOSA120_ROI_1_DS8/epoch_01382_iteration_000260000_checkpoint.pt \
        --output_file=datasets/ev/CALOSA120_ROI_1_DS8/mesh.ply \
        --textured


# Copy from docker container to host:
# docker cp 883f3693d867:/workspace/neuralangelo/logs/ev_data/CTTBLO004_MA_house_1_DS1_n/epoch_03333_iteration_000160000_checkpoint.pt\
#        /home/ubuntu/src/github/neuralangelo/datasets/CTTBLO004_MA_house_1_DS1_n/checkpoint.pt