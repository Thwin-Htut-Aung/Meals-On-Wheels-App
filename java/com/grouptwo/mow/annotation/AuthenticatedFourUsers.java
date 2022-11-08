package com.grouptwo.mow.annotation;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import org.springframework.security.access.annotation.Secured;

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Secured(value = { "ROLE_CAREGIVER", "ROLE_MEMBER", "ROLE_PARTNER", "ROLE_VOLUNTEER"})
public @interface AuthenticatedFourUsers {

}
