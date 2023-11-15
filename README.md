# Flyway on Kubernetes for Database Migrations

One of the DORA technical capabilities is [Database change management](https://dora.dev/devops-capabilities/technical/database-change-management/). DORA’s research found that integrating database work into the [software delivery](https://dora.dev/devops-capabilities/technical/continuous-delivery) process positively contributes to continuous delivery. 

Flyway is an open-source database migration tool. It is java friendly - can be ran by maven / gradle but it is not limited to Java. With k8s, you can easily run it as a Job or as a initContainer of a pod. 

This repo demostrate the use of flyway on a kubernetes cluster to update DB schema. 

There are number of files in the [sql](./sql) folder, named with the version number. When a schema change is needed, eg, adding a new column, simply add a new file for the alter table statement.

Also update the [kustomization.yaml](./kustomization.yaml) file to add the new file into `flyway-sql` configmapGenerator.


## How to try it

You will need to create a `flyway.conf` on the `k8s` folder, you can copy the `flyway.conf.sample`

To run it, run 

```
kubectl apply -k . 
```

It will create a k8s job for Flyway and apply the sql files. Sample output:

```
Flyway Community Edition 10.0.1 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://10.23.17.2:5432/postgres (PostgreSQL 14.7)
Successfully validated 3 migrations (execution time 00:00.302s)
Current version of schema "public": 2
Migrating schema "public" to version "3 - Insert person"
Successfully applied 1 migration to schema "public", now at version v3 (execution time 00:00.102s)
```

You can also use Flyway as `initContainer` of a pod so whenever the pod is started, Flyway will apply the latest schema if needed.