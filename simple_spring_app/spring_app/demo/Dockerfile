# Base image
FROM eclipse-temurin:17-jdk-alpine as builder

# Set working directory
WORKDIR /app

# Copy Gradle wrapper and build scripts
COPY gradlew gradlew
COPY gradle gradle
COPY build.gradle settings.gradle /app/

# Download dependencies
RUN ./gradlew dependencies

RUN pwd

# Copy source code
COPY src src

# Build the application
RUN ./gradlew bootJar

# Production image
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy built jar from builder stage
COPY --from=builder /app/build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
