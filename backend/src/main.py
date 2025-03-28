from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware  
from sqlalchemy.orm import Session
from sqlalchemy import text
from database import SessionLocal, engine

app = FastAPI(title="GPA Trends API")

# Allow requests from your React app (running on http://localhost:3000)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/courses")
def get_courses(db: Session = Depends(get_db)):
    try:
        result = db.execute(text("SELECT * FROM courses;"))
        # Use the _mapping attribute to convert each row into a dict
        courses = [dict(row._mapping) for row in result]
        return {"courses": courses}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
