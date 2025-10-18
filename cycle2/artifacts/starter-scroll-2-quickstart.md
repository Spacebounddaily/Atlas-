# Starter Scroll II: Quick Start Guide

## From Zero to Orbit in 10 Steps

This scroll provides a rapid path for experienced builders who need to deploy quickly.

### Prerequisites
- Familiarity with satellite systems
- Access to launch resources
- Mission approval obtained
- Ground station configured

### The Ten Steps

#### 1. Define Your Mission
```bash
export MISSION_NAME="my-satellite-mission"
export MISSION_TYPE="earth_observation"
export LAUNCH_DATE="2025-12-01"
```

#### 2. Copy the Launch Template
```bash
cp cycle2/templates/satellite-launch.template.md missions/${MISSION_NAME}.md
```

#### 3. Fill in Satellite Specifications
Edit your mission file with:
- Satellite name
- Orbital parameters
- Communication frequencies
- Primary objectives

#### 4. Prepare Registration
```bash
cp cycle2/templates/registry.template.json missions/${MISSION_NAME}-registry.json
```
Fill in all required fields accurately.

#### 5. Submit Registration
```bash
# Via email
cat missions/${MISSION_NAME}-registry.json | mail -s "Registration: ${MISSION_NAME}" registry@missioncontrol.local

# Or via API
curl -X POST https://api.cycle2.local/register \
  -H "Content-Type: application/json" \
  -d @missions/${MISSION_NAME}-registry.json
```

#### 6. Configure Ground Station
Once registered, set up your ground station:
```bash
export SATELLITE_ID="[received-from-registry]"
export GROUND_STATION_LAT="your-latitude"
export GROUND_STATION_LON="your-longitude"
```

#### 7. Pre-Launch Testing
Run through all tests:
- Communication link test
- Power system test
- Payload instrument test
- Backup system test

#### 8. Execute Launch Ritual
Follow the five stages in `artifacts/satellite-launch-ritual.md`:
1. Consecration of the Vessel
2. Vigil of Readiness
3. Moment of Ascension
4. Baptism of Function
5. Commitment to Vigilance

#### 9. Monitor Launch
During launch window:
```bash
# Start monitoring
tail -f /var/log/mission-control/${SATELLITE_ID}.log

# Watch telemetry
watch -n 1 'curl -s https://api.cycle2.local/telemetry/${SATELLITE_ID}'
```

#### 10. Post-Launch Verification
After successful orbit insertion:
- Verify all systems nominal
- Confirm communication links
- Begin mission operations
- Archive launch data

### Automated Deployment Option

For fully automated deployment, use the release script:
```bash
export SATELLITE_NAME="${MISSION_NAME}"
export RELEASE_VERSION="1.0.0"
export DEPLOYMENT_ENV="production"

./cycle2/scripts/releaseatomic.sh
```

### Common Issues and Solutions

**Issue:** Registration rejected  
**Solution:** Review registration guide and verify all fields are complete

**Issue:** Communication link failure  
**Solution:** Check ground station configuration and satellite orientation

**Issue:** Power system anomaly  
**Solution:** Switch to backup power, investigate solar array deployment

**Issue:** Orbit insertion missed  
**Solution:** Calculate next window, prepare for corrective burn

### Next Steps

After successful launch:
1. Monitor telemetry for first 72 hours continuously
2. Establish regular communication schedule
3. Begin collecting mission data
4. Report status to stakeholders
5. Archive all milestone events

### Resources
- Full Launch Template: `templates/satellite-launch.template.md`
- Registration Guide: `guides/satellite-registration.md`
- Launch Ritual: `artifacts/satellite-launch-ritual.md`
- Registry Template: `templates/registry.template.json`

---
*Scroll II of the Cycle 2 Starter Series*  
*For those who know the way*
