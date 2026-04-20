# Satellite Registration Guide - Cycle 2

## Overview
This guide provides step-by-step instructions for registering your satellite in the Cycle 2 mission registry. Proper registration ensures your satellite is tracked, monitored, and integrated into the mission control network.

## Prerequisites
Before registering your satellite, ensure you have:
- [ ] Completed satellite development and testing
- [ ] Obtained necessary mission approvals
- [ ] Prepared satellite specifications document
- [ ] Configured communication protocols
- [ ] Established ground station connectivity

## Registration Process

### Step 1: Prepare Satellite Information
Gather the following information about your satellite:
- **Satellite Name:** Unique identifier for your satellite
- **Mission Type:** Scientific, Communication, Navigation, etc.
- **Orbital Parameters:** Altitude, inclination, period
- **Communication Frequencies:** Uplink/downlink bands
- **Launch Date:** Scheduled or actual launch date
- **Estimated Lifetime:** Expected operational duration

### Step 2: Complete Registration Form
Fill out the satellite registration form with accurate information:

```
SATELLITE_NAME=[Your Satellite Name]
MISSION_TYPE=[Mission Type]
ORBITAL_ALTITUDE=[Altitude in km]
ORBITAL_INCLINATION=[Inclination in degrees]
ORBITAL_PERIOD=[Period in minutes]
UPLINK_FREQ=[Frequency in MHz]
DOWNLINK_FREQ=[Frequency in MHz]
LAUNCH_DATE=[YYYY-MM-DD]
ESTIMATED_LIFETIME=[Duration in years]
PRIMARY_CONTACT=[Contact Name]
PRIMARY_EMAIL=[Contact Email]
```

### Step 3: Submit to Registry
Submit your registration through one of the following methods:
1. **Online Portal:** Visit the mission control portal at [portal-url]
2. **Email Submission:** Send completed form to registry@missioncontrol.local
3. **API Submission:** Use the registration API endpoint

### Step 4: Await Confirmation
After submission:
1. You will receive an acknowledgment within 24 hours
2. Registration review takes 2-5 business days
3. Upon approval, you'll receive:
   - Unique Satellite ID (SATID)
   - Tracking credentials
   - Mission control access tokens
   - Ground station schedules

### Step 5: Configure Satellite Systems
Once registered, configure your satellite with:
```bash
# Set satellite ID
export SATELLITE_ID=[Your-SATID]

# Configure mission control endpoint
export MISSION_CONTROL_URL=https://control.cycle2.local

# Set authentication token
export AUTH_TOKEN=[Your-Token]
```

## Post-Registration Requirements

### Maintain Current Information
Update your registration when:
- Orbital parameters change significantly
- Communication frequencies are modified
- Mission objectives are updated
- Contact information changes

### Regular Check-ins
- Submit telemetry data every 24 hours
- Report any anomalies immediately
- Participate in scheduled communication windows
- Respond to mission control queries within 4 hours

### Compliance
All registered satellites must:
- Adhere to communication protocols
- Follow orbital debris mitigation guidelines
- Maintain operational readiness standards
- Participate in constellation coordination

## Troubleshooting

### Registration Rejected
If registration is rejected:
1. Review rejection reason in notification
2. Correct identified issues
3. Resubmit registration
4. Contact support if issues persist

### Lost Credentials
To recover lost credentials:
1. Submit credential recovery request
2. Verify ownership with backup contact
3. Receive new credentials within 48 hours

## Support
For registration assistance:
- **Email:** support@missioncontrol.local
- **Portal:** https://help.cycle2.local
- **Emergency:** +1-555-MISSION

## Appendix A: Registration Template
See `templates/registry.template.json` for the complete registration template.

## Appendix B: Compliance Checklist
- [ ] Satellite meets technical specifications
- [ ] All required documentation submitted
- [ ] Communication protocols tested
- [ ] Emergency procedures established
- [ ] Debris mitigation plan approved
