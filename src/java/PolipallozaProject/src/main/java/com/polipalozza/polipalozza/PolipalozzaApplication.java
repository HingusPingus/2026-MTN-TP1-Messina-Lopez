package com.polipalozza.polipalozza;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.polipalozza.polipalozza.repository")
@EntityScan(basePackages = "com.polipalozza.polipalozza.model")
public class PolipalozzaApplication {
    public static void main(String[] args) {
        System.out.println("🚀 INICIANDO POLIPALLOZA APPLICATION...");
        
        // Esto evita que se cierre automáticamente
        SpringApplication application = new SpringApplication(PolipalozzaApplication.class);
        application.setWebApplicationType(org.springframework.boot.WebApplicationType.SERVLET);
        application.run(args);
        
        System.out.println("✅ APPLICATION INICIADA Y CORRIENDO!");
    }
}