
px4_add_board(
	PLATFORM posix
	VENDOR modalai
	MODEL sitl
	LABEL default
	TESTING
	DRIVERS
		#adc
		#barometer # all available barometer drivers
		#batt_smbus
		camera_capture
		camera_trigger
		#differential_pressure # all available differential pressure drivers
		#distance_sensor # all available distance sensor drivers
		#dshot
		gps
		#imu/bosch/bmi088
		#imu/invensense/icm20602
		#imu/invensense/icm42688p
		irlock
		#lights/blinkm
		#lights/rgbled
		#lights/rgbled_ncp5623c
		#magnetometer # all available magnetometer drivers
		#mkblctrl
		#optical_flow # all available optical flow drivers
		#osd
		#pca9685
		power_monitor/ina226
		power_monitor/voxlpm
		#protocol_splitter
		#pwm_input
		pwm_out_sim
		#pwm_out
		#rc_input
		roboclaw
		#safety_button
		#tap_esc
		#telemetry # all available telemetry drivers
		#test_ppm
		tone_alarm
		#uavcan
		#uart_esc/modalai_esc
	MODULES
		airspeed_selector
		attitude_estimator_q
		camera_feedback
		commander
		dataman
		ekf2
		events
		fw_att_control
		fw_pos_control_l1
		land_detector
		landing_target_estimator
		load_mon
		local_position_estimator
		logger
		mavlink
		mc_att_control
		mc_hover_thrust_estimator
		mc_pos_control
		mc_rate_control
		navigator
		rc_update
		replay
		rover_pos_control
		sensors
		sih
		simulator
		temperature_compensation
		vmount
		vtol_att_control
	SYSTEMCMDS
		#bl_update
		#dmesg
		dumpfile
		esc_calib
		#hardfault_log
		#i2cdetect
		led_control
		mixer
		#modalai
		motor_ramp
		motor_test
		#mtd
		#nshterm
		param
		perf
		pwm
		#reboot
		#reflect
		sd_bench
		tests # tests and test runner
		top
		topic_listener
		tune_control
		#usb_connected
		ver
		work_queue
	EXAMPLES
		fixedwing_control # Tutorial code from https://px4.io/dev/example_fixedwing_control
		hello
		#hwtest # Hardware test
		#matlab_csv_serial
		px4_mavlink_debug # Tutorial code from http://dev.px4.io/en/debug/debug_values.html
		px4_simple_app # Tutorial code from http://dev.px4.io/en/apps/hello_sky.html
		rover_steering_control # Rover example app
		uuv_example_app
		work_item
	)


set(config_sitl_viewer jmavsim CACHE STRING "viewer for sitl")
set_property(CACHE config_sitl_viewer PROPERTY STRINGS "jmavsim;none")

set(config_sitl_debugger disable CACHE STRING "debugger for sitl")
set_property(CACHE config_sitl_debugger PROPERTY STRINGS "disable;gdb;lldb")

# If the environment variable 'replay' is defined, we are building with replay
# support. In this case, we enable the orb publisher rules.
set(REPLAY_FILE "$ENV{replay}")
if(REPLAY_FILE)
	message(STATUS "Building with uorb publisher rules support")
	add_definitions(-DORB_USE_PUBLISHER_RULES)
endif()
set(ENABLE_LOCKSTEP_SCHEDULER yes)
