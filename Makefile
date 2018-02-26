NAME=lab407

SRC=cnt_bit.v \
	cnt_tact.v \
	mtx.v \
	fsr.v \
	ftr.v \
	spi_master.v \
	spi_slave.v \
	Gen_st.v \
	MUX64_16.v \
	DISPLAY.v \
	MUX16_4.v \
	Gen4an.v \
	Gen1ms.v \
	D7seg.v \
	top.v

test: test.v $(SRC)
	iverilog $^ -o $@
	vvp $@

tags:
	ctags -R

clean:
	@rm -rf test

$(NAME): fpga

$(NAME).sof: *.v
	quartus_map --read_settings_files=on --write_settings_files=off $(NAME) -c $(NAME)
	quartus_fit --read_settings_files=off --write_settings_files=off $(NAME) -c $(NAME)
	quartus_asm --read_settings_files=off --write_settings_files=off $(NAME) -c $(NAME)
	cp output_files/$(NAME).sof $(NAME).sof

fpga: $(NAME).sof
	quartus_pgm $(NAME).cdf

.PHONY: clean tags $(NAME) fpga
