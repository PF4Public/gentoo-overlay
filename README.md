# Personal Gentoo overlay

## Keywords description
Throughout this overlay following keywords are used: **Missing**, **Testing**, **Stable**

**Missing** keywords _( \*\* )_ are used for ebuilds, which are either not yet finished or simply broken. Accept **missing** keywords only if you feel adventurous or willing to help improving these.

**Testing** keywords _( ~arch )_ signify that these ebuilds could possibly be built, or need some more work to be built. They may be compilable, but lacking some functionality. Alternatively they may be perfectly compilable, but having some dependencies in **testing**.

**Stable** keywords _( arch )_ are given to ebuilds, which were at least compiled, installed and executed. Unfortunately it is impossible to verify each and every configuration, so they may still fail under some circumstances.

## Add to your system
`layman -a pf4public`

