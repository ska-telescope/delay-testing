program test_calc11

  implicit none

  integer, parameter :: dp = kind(0.0d0)

  integer :: nant, ntimes
  real(dp) :: refx, refy, refz, leapsec
  character(len=128) :: jpx_de421
  logical, dimension(:), allocatable :: ssobj
  real(dp), dimension(:), allocatable :: antx, anty, antz, temp, &
      pressure, humidity, mjd, ra, dec, dx, dy, dut, axisoff
  real(dp), dimension(:, :), allocatable :: geodelay, drydelay, &
      wetdelay
  character(len=8), dimension(:), allocatable :: sourcename

  nant = 1
  ntimes = 1

  allocate(antx(nant))
  allocate(anty(nant))
  allocate(antz(nant))
  allocate(temp(nant))
  allocate(pressure(nant))
  allocate(humidity(nant))
  allocate(axisoff(nant))

  allocate(mjd(ntimes))
  allocate(ra(ntimes))
  allocate(dec(ntimes))
  allocate(ssobj(ntimes))
  allocate(dx(ntimes))
  allocate(dy(ntimes))
  allocate(dut(ntimes))
  allocate(sourcename(ntimes))

  allocate(geodelay(ntimes, nant))
  allocate(drydelay(ntimes, nant))
  allocate(wetdelay(ntimes, nant))

  refx = 0.0_dp
  refy = 0.0_dp
  refz = 0.0_dp
  antx = 0.0_dp
  anty = 0.0_dp
  antz = 0.0_dp
  temp = 0.0_dp
  pressure = 0.0_dp
  humidity = 0.0_dp
  mjd = 58849.0_dp
  ra = 0.0_dp
  dec = 0.0_dp
  ssobj = .false.
  dx = 0.0_dp
  dy = 0.0_dp
  dut = 0.0_dp
  leapsec = 0.0_dp
  axisoff = 0.0_dp
  sourcename = ' '
  jpx_de421 = 'data/DE421_little_Endian'

  call almacalc(refx, refy, refz, nant, antx, anty, antz, temp, &
      pressure, humidity, ntimes, mjd, ra, dec, ssobj, dx, dy, dut, &
      leapsec, axisoff, sourcename, JPX_DE421, geodelay, drydelay, &
      wetdelay)

  print *, geodelay
  print *, drydelay
  print *, wetdelay

  deallocate(wetdelay)
  deallocate(drydelay)
  deallocate(geodelay)

  deallocate(dut)
  deallocate(dy)
  deallocate(dx)
  deallocate(ssobj)
  deallocate(dec)
  deallocate(ra)
  deallocate(mjd)
  
  deallocate(axisoff)
  deallocate(humidity)
  deallocate(pressure)
  deallocate(temp)
  deallocate(antz)
  deallocate(anty)
  deallocate(antx)

end program test_calc11
