Facter.add(:nvidia_driver_version) do
  confine :kernel => 'Linux'
  setcode do
    %x(modinfo --field=version nvidia 2>/dev/null)
  end
end
