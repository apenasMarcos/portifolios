# Etapa 1: Build
FROM gradle:8.2.1-jdk17 AS build
WORKDIR /app

# Copia primeiro só arquivos de build (melhora cache)
COPY build.gradle settings.gradle ./
COPY gradle ./gradle

RUN gradle dependencies --no-daemon

# Agora copia o resto
COPY . .

RUN gradle bootJar --no-daemon

# Etapa 2: Runtime
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]