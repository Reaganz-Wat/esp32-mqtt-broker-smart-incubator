FROM eclipse-mosquitto:2

COPY mosquitto/config/mosquitto.conf /mosquitto/config/mosquitto.conf

RUN mosquitto_passwd -c -b /mosquitto/config/passwd esp32_client esp32pass && \
    mosquitto_passwd -b /mosquitto/config/passwd mobile_client mobilepass && \
    mosquitto_passwd -b /mosquitto/config/passwd admin adminpass && \
    chown mosquitto:mosquitto /mosquitto/config/passwd && \
    chmod 600 /mosquitto/config/passwd

EXPOSE 1883 8883 9001
