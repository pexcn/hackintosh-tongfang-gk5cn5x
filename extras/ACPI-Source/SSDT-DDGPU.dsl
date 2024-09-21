//
// Disable NVIDIA GPU
//
DefinitionBlock ("", "SSDT", 2, "ACDT", "DDGPU", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP._ON_, MethodObj)    // 0 Arguments
    External (XPTS, MethodObj)    // 1 Arguments
    External (ZWAK, MethodObj)    // 1 Arguments

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        // Turn on DGPU before sleeping to solve sleep issue
        If (_OSI ("Darwin"))
        {
            \DGPU._ON ()
        }

        \XPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (_OSI ("Darwin"))
        {
            // Need to turn off DGPU before original _WAK()
            \DGPU._OFF ()
        }
        // call into original _WAK method
        Local0 = ZWAK (Arg0)

        // return value from original _WAK
        Return (Local0)
    }

    Device (DGPU)
    {
        Name (_HID, "DGPU1000")  // _HID: Hardware ID
        Name (RMEN, One)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _OFF ()
        }

        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
            If (CondRefOf (\_SB.PCI0.PEG0.PEGP._ON))
            {
                \_SB.PCI0.PEG0.PEGP._ON ()
            }
        }

        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
            {
                \_SB.PCI0.PEG0.PEGP._OFF ()
            }
        }
    }
}
