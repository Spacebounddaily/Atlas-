# Cycle 2 Satellite Expansion

Welcome to the Cycle 2 satellite expansion initiative. This directory contains all the templates, scripts, guides, and artifacts needed to successfully deploy and manage satellites in the Cycle 2 mission constellation.

## Directory Structure

```
cycle2/
├── templates/          # Templates for satellite configuration and registration
├── scripts/            # Automation scripts for deployment and release
├── guides/             # Comprehensive guides for various processes
└── artifacts/          # Mission artifacts including rituals and starter scrolls
```

## Quick Start

If you're new to satellite deployment:
1. Read `artifacts/starter-scroll-1-foundation.md` for foundational concepts
2. Follow `artifacts/starter-scroll-2-quickstart.md` for rapid deployment
3. Study `artifacts/satellite-launch-ritual.md` for the complete launch process

If you're experienced and ready to deploy:
1. Copy `templates/satellite-launch.template.md` for your mission
2. Complete `templates/registry.template.json` with your satellite details
3. Follow `guides/satellite-registration.md` to register your satellite
4. Use `scripts/releaseatomic.sh` for atomic deployment

## Key Resources

### Templates
- **satellite-launch.template.md** - Complete launch planning template
- **registry.template.json** - Satellite registration data structure

### Scripts
- **releaseatomic.sh** - Atomic release script with rollback capability

### Guides
- **satellite-registration.md** - Step-by-step registration instructions

### Artifacts
- **satellite-launch-ritual.md** - The complete launch ritual for Cycle 2
- **starter-scroll-1-foundation.md** - Foundational concepts and exercises
- **starter-scroll-2-quickstart.md** - Quick start guide for rapid deployment

## Using the Release Script

The atomic release script ensures all-or-nothing deployment:

```bash
cd cycle2/scripts
export SATELLITE_NAME="your-satellite-name"
export RELEASE_VERSION="1.0.0"
export DEPLOYMENT_ENV="production"
./releaseatomic.sh
```

Features:
- Atomic deployment with snapshot capability
- Automatic rollback on failure
- Comprehensive logging
- Environment validation

## Registration Process

1. Prepare your satellite information
2. Fill out the registration template
3. Submit via portal, email, or API
4. Wait for confirmation (24-48 hours)
5. Configure satellite with received credentials

See `guides/satellite-registration.md` for detailed instructions.

## Launch Ritual

The Cycle 2 launch ritual ensures disciplined, thorough execution of satellite missions through five stages:

1. **Consecration of the Vessel** - Pre-launch preparation
2. **Vigil of Readiness** - 48-hour monitoring before launch
3. **Moment of Ascension** - Launch sequence execution
4. **Baptism of Function** - First 24 hours in orbit
5. **Commitment to Vigilance** - Ongoing mission management

## Support and Resources

For assistance:
- Review the guides in `guides/`
- Consult the starter scrolls in `artifacts/`
- Contact mission control: support@missioncontrol.local
- Emergency contact: +1-555-MISSION

## Contributing

When adding new satellites to the Cycle 2 constellation:
1. Follow the established templates
2. Document all custom configurations
3. Share lessons learned with the community
4. Update guides based on real-world experience

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file in the root directory for details.

---

**May your satellites fly true, your data flow freely, and your missions succeed beyond expectation.**

*Cycle 2 - Forever Forward*
