#!/bin/bash

# Wacht 1 seconde voordat je de pakketlijst bijwerkt
sleep 1

apt list --upgradable 2>/dev/null > /tmp/updates_list

# Controleer of het bestand leeg is
if [ -s /tmp/updates_list ]; then
    # Tel het aantal regels, maar sla de regel "Listing..." over
    updates=$(awk '!/^Listing/ && NF {count++} END {print count}' /tmp/updates_list)
else
    updates=0
fi

# Geef alleen het aantal updates weer
echo "$updates"

rm -f /tmp/updates_list
