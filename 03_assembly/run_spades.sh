set -e
true
true
/usr/libexec/spades/spades-hammer /home/yamkelani/Klebs_miniProject/03_assembly/corrected/configs/config.info
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/compress_all.py --input_file /home/yamkelani/Klebs_miniProject/03_assembly/corrected/corrected.yaml --ext_python_modules_home /usr/share/spades --max_threads 16 --output_dir /home/yamkelani/Klebs_miniProject/03_assembly/corrected --gzip_output
true
true
/usr/libexec/spades/spades-core /home/yamkelani/Klebs_miniProject/03_assembly/K21/configs/config.info
/usr/libexec/spades/spades-core /home/yamkelani/Klebs_miniProject/03_assembly/K33/configs/config.info
/usr/libexec/spades/spades-core /home/yamkelani/Klebs_miniProject/03_assembly/K55/configs/config.info
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/copy_files.py /home/yamkelani/Klebs_miniProject/03_assembly/K55/before_rr.fasta /home/yamkelani/Klebs_miniProject/03_assembly/before_rr.fasta /home/yamkelani/Klebs_miniProject/03_assembly/K55/assembly_graph_after_simplification.gfa /home/yamkelani/Klebs_miniProject/03_assembly/assembly_graph_after_simplification.gfa /home/yamkelani/Klebs_miniProject/03_assembly/K55/final_contigs.fasta /home/yamkelani/Klebs_miniProject/03_assembly/contigs.fasta /home/yamkelani/Klebs_miniProject/03_assembly/K55/first_pe_contigs.fasta /home/yamkelani/Klebs_miniProject/03_assembly/first_pe_contigs.fasta /home/yamkelani/Klebs_miniProject/03_assembly/K55/strain_graph.gfa /home/yamkelani/Klebs_miniProject/03_assembly/strain_graph.gfa /home/yamkelani/Klebs_miniProject/03_assembly/K55/scaffolds.fasta /home/yamkelani/Klebs_miniProject/03_assembly/scaffolds.fasta /home/yamkelani/Klebs_miniProject/03_assembly/K55/scaffolds.paths /home/yamkelani/Klebs_miniProject/03_assembly/scaffolds.paths /home/yamkelani/Klebs_miniProject/03_assembly/K55/assembly_graph_with_scaffolds.gfa /home/yamkelani/Klebs_miniProject/03_assembly/assembly_graph_with_scaffolds.gfa /home/yamkelani/Klebs_miniProject/03_assembly/K55/assembly_graph.fastg /home/yamkelani/Klebs_miniProject/03_assembly/assembly_graph.fastg /home/yamkelani/Klebs_miniProject/03_assembly/K55/final_contigs.paths /home/yamkelani/Klebs_miniProject/03_assembly/contigs.paths
true
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /home/yamkelani/Klebs_miniProject/03_assembly/scaffolds.fasta --misc_dir /home/yamkelani/Klebs_miniProject/03_assembly/misc --threshold_for_breaking_scaffolds 3
true
