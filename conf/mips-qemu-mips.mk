# -*- makefile -*-
# Generated by genmk.rb, please don't edit!
LINK_BASE = 0x80010000
target_machine=qemu-mips
COMMON_CFLAGS += -march=mips3
COMMON_ASFLAGS += -march=mips3
include $(srcdir)/conf/mips.mk

pkglib_IMAGES = kernel.img
kernel_img_SOURCES = kern/$(target_cpu)/startup.S \
	kern/main.c kern/device.c kern/$(target_cpu)/init.c \
	kern/$(target_cpu)/$(target_machine)/init.c 		\
	kern/disk.c kern/dl.c kern/err.c kern/file.c kern/fs.c 		\
	kern/misc.c kern/mm.c kern/term.c 	\
	kern/rescue_parser.c kern/rescue_reader.c \
	kern/list.c kern/handler.c kern/command.c kern/corecmd.c	\
	kern/parser.c kern/partition.c kern/env.c kern/$(target_cpu)/dl.c 	\
	kern/generic/millisleep.c kern/generic/rtc_get_time_ms.c kern/time.c    \
	symlist.c kern/$(target_cpu)/cache.S

clean-image-kernel.img.1:
	rm -f kernel.img kernel.exec kernel_img-kern___target_cpu__startup.o kernel_img-kern_main.o kernel_img-kern_device.o kernel_img-kern___target_cpu__init.o kernel_img-kern___target_cpu____target_machine__init.o kernel_img-kern_disk.o kernel_img-kern_dl.o kernel_img-kern_err.o kernel_img-kern_file.o kernel_img-kern_fs.o kernel_img-kern_misc.o kernel_img-kern_mm.o kernel_img-kern_term.o kernel_img-kern_rescue_parser.o kernel_img-kern_rescue_reader.o kernel_img-kern_list.o kernel_img-kern_handler.o kernel_img-kern_command.o kernel_img-kern_corecmd.o kernel_img-kern_parser.o kernel_img-kern_partition.o kernel_img-kern_env.o kernel_img-kern___target_cpu__dl.o kernel_img-kern_generic_millisleep.o kernel_img-kern_generic_rtc_get_time_ms.o kernel_img-kern_time.o kernel_img-symlist.o kernel_img-kern___target_cpu__cache.o

CLEAN_IMAGE_TARGETS += clean-image-kernel.img.1

mostlyclean-image-kernel.img.1:
	rm -f kernel_img-kern___target_cpu__startup.d kernel_img-kern_main.d kernel_img-kern_device.d kernel_img-kern___target_cpu__init.d kernel_img-kern___target_cpu____target_machine__init.d kernel_img-kern_disk.d kernel_img-kern_dl.d kernel_img-kern_err.d kernel_img-kern_file.d kernel_img-kern_fs.d kernel_img-kern_misc.d kernel_img-kern_mm.d kernel_img-kern_term.d kernel_img-kern_rescue_parser.d kernel_img-kern_rescue_reader.d kernel_img-kern_list.d kernel_img-kern_handler.d kernel_img-kern_command.d kernel_img-kern_corecmd.d kernel_img-kern_parser.d kernel_img-kern_partition.d kernel_img-kern_env.d kernel_img-kern___target_cpu__dl.d kernel_img-kern_generic_millisleep.d kernel_img-kern_generic_rtc_get_time_ms.d kernel_img-kern_time.d kernel_img-symlist.d kernel_img-kern___target_cpu__cache.d

MOSTLYCLEAN_IMAGE_TARGETS += mostlyclean-image-kernel.img.1

ifneq ($(TARGET_APPLE_CC),1)
kernel.img: kernel.exec
	$(OBJCOPY) -O $(kernel_img_FORMAT) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .reginfo -R .rel.dyn $< $@
else
ifneq (kernel.exec,kernel.exec)
kernel.img: kernel.exec ./grub-macho2img
	./grub-macho2img $< $@
else
kernel.img: kernel.exec ./grub-macho2img
	./grub-macho2img --bss $< $@
endif
endif

kernel.exec: kernel_img-kern___target_cpu__startup.o kernel_img-kern_main.o kernel_img-kern_device.o kernel_img-kern___target_cpu__init.o kernel_img-kern___target_cpu____target_machine__init.o kernel_img-kern_disk.o kernel_img-kern_dl.o kernel_img-kern_err.o kernel_img-kern_file.o kernel_img-kern_fs.o kernel_img-kern_misc.o kernel_img-kern_mm.o kernel_img-kern_term.o kernel_img-kern_rescue_parser.o kernel_img-kern_rescue_reader.o kernel_img-kern_list.o kernel_img-kern_handler.o kernel_img-kern_command.o kernel_img-kern_corecmd.o kernel_img-kern_parser.o kernel_img-kern_partition.o kernel_img-kern_env.o kernel_img-kern___target_cpu__dl.o kernel_img-kern_generic_millisleep.o kernel_img-kern_generic_rtc_get_time_ms.o kernel_img-kern_time.o kernel_img-symlist.o kernel_img-kern___target_cpu__cache.o
	$(TARGET_CC) -o $@ $^ $(TARGET_LDFLAGS) $(kernel_img_LDFLAGS)

kernel_img-kern___target_cpu__startup.o: kern/$(target_cpu)/startup.S $(kern/$(target_cpu)/startup.S_DEPENDENCIES)
	$(TARGET_CC) -Ikern/$(target_cpu) -I$(srcdir)/kern/$(target_cpu) $(TARGET_CPPFLAGS) -DASM_FILE=1 $(TARGET_ASFLAGS) $(kernel_img_ASFLAGS) -MD -c -o $@ $<
-include kernel_img-kern___target_cpu__startup.d

kernel_img-kern_main.o: kern/main.c $(kern/main.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_main.d

kernel_img-kern_device.o: kern/device.c $(kern/device.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_device.d

kernel_img-kern___target_cpu__init.o: kern/$(target_cpu)/init.c $(kern/$(target_cpu)/init.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern/$(target_cpu) -I$(srcdir)/kern/$(target_cpu) $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern___target_cpu__init.d

kernel_img-kern___target_cpu____target_machine__init.o: kern/$(target_cpu)/$(target_machine)/init.c $(kern/$(target_cpu)/$(target_machine)/init.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern/$(target_cpu)/$(target_machine) -I$(srcdir)/kern/$(target_cpu)/$(target_machine) $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern___target_cpu____target_machine__init.d

kernel_img-kern_disk.o: kern/disk.c $(kern/disk.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_disk.d

kernel_img-kern_dl.o: kern/dl.c $(kern/dl.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_dl.d

kernel_img-kern_err.o: kern/err.c $(kern/err.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_err.d

kernel_img-kern_file.o: kern/file.c $(kern/file.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_file.d

kernel_img-kern_fs.o: kern/fs.c $(kern/fs.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_fs.d

kernel_img-kern_misc.o: kern/misc.c $(kern/misc.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_misc.d

kernel_img-kern_mm.o: kern/mm.c $(kern/mm.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_mm.d

kernel_img-kern_term.o: kern/term.c $(kern/term.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_term.d

kernel_img-kern_rescue_parser.o: kern/rescue_parser.c $(kern/rescue_parser.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_rescue_parser.d

kernel_img-kern_rescue_reader.o: kern/rescue_reader.c $(kern/rescue_reader.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_rescue_reader.d

kernel_img-kern_list.o: kern/list.c $(kern/list.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_list.d

kernel_img-kern_handler.o: kern/handler.c $(kern/handler.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_handler.d

kernel_img-kern_command.o: kern/command.c $(kern/command.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_command.d

kernel_img-kern_corecmd.o: kern/corecmd.c $(kern/corecmd.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_corecmd.d

kernel_img-kern_parser.o: kern/parser.c $(kern/parser.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_parser.d

kernel_img-kern_partition.o: kern/partition.c $(kern/partition.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_partition.d

kernel_img-kern_env.o: kern/env.c $(kern/env.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_env.d

kernel_img-kern___target_cpu__dl.o: kern/$(target_cpu)/dl.c $(kern/$(target_cpu)/dl.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern/$(target_cpu) -I$(srcdir)/kern/$(target_cpu) $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern___target_cpu__dl.d

kernel_img-kern_generic_millisleep.o: kern/generic/millisleep.c $(kern/generic/millisleep.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern/generic -I$(srcdir)/kern/generic $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_generic_millisleep.d

kernel_img-kern_generic_rtc_get_time_ms.o: kern/generic/rtc_get_time_ms.c $(kern/generic/rtc_get_time_ms.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern/generic -I$(srcdir)/kern/generic $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_generic_rtc_get_time_ms.d

kernel_img-kern_time.o: kern/time.c $(kern/time.c_DEPENDENCIES)
	$(TARGET_CC) -Ikern -I$(srcdir)/kern $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-kern_time.d

kernel_img-symlist.o: symlist.c $(symlist.c_DEPENDENCIES)
	$(TARGET_CC) -I. -I$(srcdir)/. $(TARGET_CPPFLAGS)  $(TARGET_CFLAGS) $(kernel_img_CFLAGS) -MD -c -o $@ $<
-include kernel_img-symlist.d

kernel_img-kern___target_cpu__cache.o: kern/$(target_cpu)/cache.S $(kern/$(target_cpu)/cache.S_DEPENDENCIES)
	$(TARGET_CC) -Ikern/$(target_cpu) -I$(srcdir)/kern/$(target_cpu) $(TARGET_CPPFLAGS) -DASM_FILE=1 $(TARGET_ASFLAGS) $(kernel_img_ASFLAGS) -MD -c -o $@ $<
-include kernel_img-kern___target_cpu__cache.d

kernel_img_CFLAGS = $(COMMON_CFLAGS)
kernel_img_ASFLAGS = $(COMMON_ASFLAGS)
kernel_img_LDFLAGS = $(COMMON_LDFLAGS) -static-libgcc -lgcc \
	-Wl,-N,-S,-Ttext,$(LINK_BASE),-Bstatic
kernel_img_FORMAT = binary
