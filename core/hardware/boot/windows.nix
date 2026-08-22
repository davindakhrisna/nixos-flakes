# Windows 10 compatibility, NTFS/exFAT read-write support & dual-boot RTC sync
{pkgs, ...}: {
  # Enable NTFS and exFAT filesystem drivers
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
  ];

  # Windows filesystem tools
  environment.systemPackages = with pkgs; [
    ntfs3g # Read/write NTFS support
    dosfstools # FAT/FAT32 utilities
    exfatprogs # exFAT utilities
  ];

  # Prevent time mismatch when dual-booting with Windows 10
  time.hardwareClockInLocalTime = true;
}
