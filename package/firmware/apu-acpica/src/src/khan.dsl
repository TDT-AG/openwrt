DefinitionBlock ("khan.aml", "SSDT", 5, "TDT", "KHAN", 2)
{
	External (\_SB.PCI0.SBUS, DeviceObj)

	Scope (\_SB.PCI0.SBUS)
	{
		Device (I2C0)
		{
			Name (_ADR, Zero)
			Device (GPIO)
			{
				Name (_HID, "PRP0001")
				Name (_DDN, "MCP23017 pinctrl")
				Name (_CRS, ResourceTemplate ()
				{
					I2cSerialBus (
						0x24,
						ControllerInitiated,
						100000,
						AddressingMode7Bit,
						"\\_SB.PCI0.SBUS.I2C0",
						0x00
					)
				})
				Name (_DSD, Package ()
				{
					ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
					Package () {
						Package () { "compatible", "microchip,mcp23017" },
					}
				})

				Device (LEDS)
				{
					Name (_HID, "PRP0001")
					Name (_DDN, "GPIO LEDs device")
					Name (_CRS, ResourceTemplate () {
						GpioIo (
							Exclusive,
							PullNone,
							0,
							0,
							IoRestrictionOutputOnly,
							"\\_SB.PCI0.SBUS.I2C0.GPIO",
							0)
						{
							0,
							1,
							2,
							3,
							4,
							5,
							6,
							7,
						}
					})

					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () { "compatible", Package() { "gpio-leds" } },
						},
						ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
						Package () {
							Package () {"led-0", "LED0"},
							Package () {"led-1", "LED1"},
							Package () {"led-2", "LED2"},
							Package () {"led-3", "LED3"},
							Package () {"led-4", "LED4"},
							Package () {"led-5", "LED5"},
							Package () {"led-6", "LED6"},
							Package () {"led-7", "LED7"},
						}
					})

					Name (LED0, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led1"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 0, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED1, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led2"},
							Package () {"default-state", "off"},
								Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 1, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED2, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led3"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 2, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED3, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led4"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 3, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED4, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led5"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 4, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED5, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led6"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 5, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED6, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led7"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 6, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})

					Name (LED7, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"label", "khan:green:led8"},
							Package () {"default-state", "off"},
							Package () {"linux,default-trigger", "default-off"},
							Package () {"gpios", Package () {^LEDS, 0, 7, 1}},
							Package () {"retain-state-suspended", 1},
						}
					})
				}
			}
		}
	}
}
