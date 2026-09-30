-- CreateEnum
CREATE TYPE "MuscleGroup" AS ENUM ('CHEST', 'BACK', 'SHOULDERS', 'BICEPS', 'TRICEPS', 'ABS', 'QUADRICEPS', 'HAMSTRINGS', 'GLUTES', 'CALFS');

-- CreateTable
CREATE TABLE "exercices" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "muscleGroup" "MuscleGroup"[],

    CONSTRAINT "exercices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "workouts" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "workouts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExercisesOnWorkouts" (
    "exerciceId" TEXT NOT NULL,
    "workoutId" TEXT NOT NULL,
    "series" INTEGER NOT NULL DEFAULT 1,
    "reps" INTEGER NOT NULL DEFAULT 0,
    "weight" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "ExercisesOnWorkouts_pkey" PRIMARY KEY ("exerciceId","workoutId")
);

-- AddForeignKey
ALTER TABLE "ExercisesOnWorkouts" ADD CONSTRAINT "ExercisesOnWorkouts_exerciceId_fkey" FOREIGN KEY ("exerciceId") REFERENCES "exercices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExercisesOnWorkouts" ADD CONSTRAINT "ExercisesOnWorkouts_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "workouts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
